import urlResolve from 'rollup-plugin-url-resolve';
import { rollupPluginHTML as html } from '@web/rollup-plugin-html';
import { copy }  from '@web/rollup-plugin-copy';

export default [
	{
		
		input: './main.js',
		
		output: {
			dir: 'build',
			format: 'es'
		},
		
		plugins: [
			urlResolve({
				cacheManager: '.cache',
				minify: true,
			}),
			html({
				input: 'index-r.html',
				minify: true,
			}),
			copy({
				patterns: '**/*.{png,svg,json,md,ico,map,wasm}',
				exclude: [ 'node_modules', 'dist', 'README.md', 'package.json', 'pacakge-lock.json', 'build' ]
			})
		]
		
	}
];