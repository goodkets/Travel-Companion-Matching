import {
	createSSRApp
} from "vue";
import App from "./App.vue";
import uviewPlus from 'uview-plus'
import '@/styles/index.scss'
import store from "./store/index.js"
import "uview-plus/index.scss";
export function createApp() {
	const app = createSSRApp(App);
	app.use(store)
	app.use(uviewPlus)
	return {
		app,
	};
}