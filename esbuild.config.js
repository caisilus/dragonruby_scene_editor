const path = require('path');

const esbuild = require("esbuild")

const vuePlugin = require("esbuild-plugin-vue3");
const { generateIndexHTML } = require('esbuild-plugin-vue3/dist/html');

function build() {
  esbuild.build({
    entryPoints: ["application.js"],
    bundle: true,
    outdir: path.join(process.cwd(), "app/assets/builds"),
    absWorkingDir: path.join(process.cwd(), "app/javascript"),
    // custom plugins will be inserted is this array
    plugins: [vuePlugin()],
  }).catch(() => process.exit(1));
}

async function watch() {
  let ctx = await esbuild.context({
    entryPoints: ["application.js"],
    bundle: true,
    outdir: path.join(process.cwd(), "app/assets/builds"),
    absWorkingDir: path.join(process.cwd(), "app/javascript"),
    // custom plugins will be inserted is this array
    plugins: [vuePlugin()],
  });

  await ctx.watch();
  console.log('Watching...')
}

watch()
