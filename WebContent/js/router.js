var router = new VueRouter({
	routes : [
		{
			path : '/',
			component : httpVueLoader('components/main/main.vue')
		},
		{
			path : '/boardMain',
			component : httpVueLoader('components/board/boardMain.vue')
		},
		{
			path : '/boardWrite',
			component : httpVueLoader('components/board/boardWrite.vue')
		},
		{
			path : '/boardRead',
			component : httpVueLoader('components/board/boardRead.vue')
		},
		{
			path : '/boardModify',
			component : httpVueLoader('components/board/boardModify.vue')
		},
		{
			path : '/boardDelete',
			beforeEnter(to, from, next){
				alert('삭제되었습니다.');
				next('/boardMain');
			}
		},
		{
			path : '/login',
			component : httpVueLoader('components/user/login.vue')
		},
		{
			path : '/join',
			component : httpVueLoader('components/user/join.vue')
		},
		{
			path : '/modify',
			component : httpVueLoader('components/user/modifyUser.vue')
		},
		{
			path : '/logout',
			beforeEnter(to, from, next){
				alert("로그아웃 되었습니다.");
				next("/");
			}
		}
	],
	// 페이지 이동시 최상단으로 이동
	scrollBehavior(to, from, savedPosition){
		return {
			x : 0,
			y : 0
		}
	}
})