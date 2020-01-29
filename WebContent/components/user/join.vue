<template>
	<div class="container" style="margin-top:100px">
		<div class="row">
			<div class="col-sm-3"></div>
			<div class="col-sm-6">
				<div class="card shadow">
					<div class="card-body">
						<div class="form-group">
							<label for="userName">이름</label>
							<input type="text" id="userName" v-model="userName" class="form-control"/>
						</div>
						<div class="form-group">
							<label for="userId">아이디</label>
							<div class="input-group">
								<input type="text" id="userId" v-model="userId" class="form-control" @keydown="resetCheckId"/>
								<div class="input-group-append">
									<button type="button" @click="checkUserIdExist" class="btn btn-primary">중복확인</button>
								</div>
							</div>
						</div>
						<div class="form-group">
							<label for="userPw">비밀번호</label>
							<input type="password" id="userPw" v-model="userPw" class="form-control"/>
						</div>
						<div class="form-group">
							<label for="userPw2">비밀번호 확인</label>
							<input type="password" id="userPw2" v-model="userPw2" class="form-control"/>
						</div>
						<div class="form-group">
							<div class="text-right">
								<button type="button" @click="checkInput" class="btn btn-primary">회원가입</button>
							</div>
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
		data : function() {
			return {
				userName : '',
				userId : '',
				userPw : '',
				userPw2 : '',
				checkUserId : false
			}
		}, 
		methods : {
			checkInput : function(){
				if(this.userName.length < 2){
					alert("이름은 두 글자 이상 입니다");
					this.userName = '';
					$("#userName").focus();
					return;
				}
				if(this.userId.length < 4){
					alert("아이디는 4글자 이상입니다");
					this.userId = '';
					$("#userId").focus();
					return;
				}
				if(this.userPw.length < 4){
					alert("비밀번호는 4글자 이상입니다");
					this.userPw = '';
					$("#userPw").focus();
					return;
				}
				if(this.userPw2.length < 4){
					alert("비밀번호는 4글자 이상입니다");
					this.userPw2 = '';
					$("#userPw2").focus();
					return;
				}
				if(this.userPw != this.userPw2){
					alert("비밀번호가 일치하지 않습니다");
					this.userPw = '';
					this.userPw2 = '';
					$("#userPw").focus();
					return;
				}
				if(this.checkUserId == false){
					alert("아이디 중복확인을 해주세요.");
					$("#userId").focus();
					return;
				}
				
				var params = new URLSearchParams();
				params.append('userName', this.userName);
				params.append('userId', this.userId);
				params.append('userPw', this.userPw);
				
				axios.post('server/user/joinUser.jsp', params).then((response) => {
					if(response.data.result == true) {
						alert('가입이 완료되었습니다.');
						this.$router.push('/login');
					}
				});

			},
			checkUserIdExist : function(){
				var params = new URLSearchParams();
				params.append('userId', this.userId);

				axios.post('server/user/checkUserId.jsp', params).then((response) => {
					if(response.data.checkResult == true) {
						alert('사용할수 없는 아이디 입니다.');
						this.userId = '';
						$("#userId").focus();
						this.checkUserId = false;
					} else {
						alert("사용할 수 있는 아이디입니다.");
						this.checkUserId = true;
					}
				});
			},
			resetCheckId : function(){
				this.checkUserId = false;
			}
		}
	}
</script>