<template>
	<div class="container" style="margin-top:100px">
		<div class="row">
			<div class="col-sm-3"></div>
			<div class="col-sm-6">
				<div class="card shadow">
					<div class="card-body">
						<div class="form-group">
							<label for="userName">이름</label>
							<input type="text" id="userName" v-model="userName" class="form-control" disabled="disabled"/>
						</div>
						<div class="form-group">
							<label for="userId">아이디</label>
							<input type="text" id="userId" v-model="userId" class="form-control" disabled="disabled"/>
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
								<button type="button" @click="checkInput" class="btn btn-primary">정보수정</button>
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
		data : function(){
			return {
				userName : "사용자 이름",
				userId : "사용자 아이디",
				userPw : "",
				userPw2 : ""
			}
		},
		methods : {
			checkInput : function(){
				if(this.userPw.length < 4){
					alert("비밀번호는 4글자 이상입니다");
					this.userPw = "";
					$("#userPw").focus();
					return;
				}
				if(this.userPw2.length < 4){
					alert("비밀번호는 4글자 이상입니다");
					this.userPw2 = "";
					$("#userPw2").focus();
					return;
				}
				if(this.userPw != this.userPw2){
					alert("비밀번호가 일치하지 않습니다");
					this.userPw = "";
					this.userPw2 = "";
					$("#userPw").focus();
					return;
				}
				
				alert("정보가 수정되었습니다.");
				this.userPw = "";
				this.userPw2 = "";
			}
		}
	}
	
	function checkInput(){
		
		var userPw = $("#userPw").val();
		var userPw2 = $("#userPw2").val();
		
		if(userPw.length < 4){
			alert("비밀번호는 4글자 이상입니다")
			$("#userPw").val("");
			$("#userPw").focus();
			return false;
		}
		if(userPw2.length < 4){
			alert("비밀번호는 4글자 이상입니다")
			$("#userPw2").val("");
			$("#userPw2").focus();
			return false;
		}
		if(userPw != userPw2){
			alert("비밀번호가 일치하지 않습니다")
			$("#userPw").val("");
			$("#userPw2").val("");
			$("#userPw").focus();
			return false;
		}
		
		return true
	}
</script>