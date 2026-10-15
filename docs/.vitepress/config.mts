import { defineConfig } from "vitepress";

// https://vitepress.dev/reference/site-config
export default defineConfig({
	title: "Header",
	description: "Script snippets for Roblox Studio",

	base: "/Header/",

	themeConfig: {
		// https://vitepress.dev/reference/default-theme-config
		nav: [
			{ text: "Home", link: "/" },
		],

		search: {
			provider: "local",
		},

		socialLinks: [
			{ icon: "github", link: "https://github.com/vvacillator/Header" },
		],
	},
});