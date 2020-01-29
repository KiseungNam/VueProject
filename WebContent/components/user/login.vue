<template>
	<div class="container" style="margin-top:100px">
		<div class="row">
			<div class="col-sm-3"></div>
			<div class="col-sm-6">
				<div class="card shadow">
					<div class="card-body">
						<div class="alert alert-danger" v-if='isLoginFail == true'>
							<h3>로그인 실패</h3>
							<p>아이디 비밀번호를 확인해주세요</p>
						</div>
						<div class="form-group">
							<label for="userId">아이디</label>
							<input type="text" id="userId" v-model="userId" class="form-control"/>
						</div>
						<div class="form-group">
							<label for="userPw">비밀번호</label>
							<input type="password" id="userPw" v-model="userPw" class="form-control"/>
						</div>
						<div class="form-group text-right">
							<button type="button" @click='checkInput' class="btn btn-primary">로그인</button>
							<router-link to="/join" class="btn btn-danger">회원가입</router-link>
						</div>
					</div>
				</div>
			</div>
			<div class="col-sm-3"></div>
		</div>
	</div>
</template>
<script>
	module.exports = {
		data : function(){
			return {
				isLoginFail : false,
				userId : '',
				userPw : ''
			}
		},
		methods : {
			check_input :function(){
				// 유효성 검사
				if(this.userId.length < 4){
					alert("아이디는 4글자 이상입니다")
					this.userId = '';
					$("#userId").focus();
					return;
				}
				if(this.userPw.length < 4){
					alert("비밀번호는 4글자 이상입니다")
					this.userPw = '';
					$("#userPw").focus();
					return;
				}
				
				alert("로그인 되었습니다.");
				this.$router.push("/");
			}
		}
	}
</script>