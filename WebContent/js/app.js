$(function(){
	var app = new Vue({
		el : '#app',
		router : router,
		components : {
			'top-menu' : httpVueLoader('components/common/topMenu.vue'),
			'bottom-info' : httpVueLoader('components/common/bottomInfo.vue')
		}
	})
	
});