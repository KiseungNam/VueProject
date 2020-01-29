<template>
	<div class="container" style="margin-top:100px">
		<div class="row">
			<div class="col-sm-3"></div>
			<div class="col-sm-6">
				<div class="card shadow">
					<div class="card-body">
						<div class="form-group">
							<label for="boardSubject">제목</label>
							<input type="text" id="boardSubject" v-model="boardSubject" class="form-control"/>
						</div>
						<div class="form-group">
							<label for="boardContent">내용</label>
							<textarea id="boardContent" v-model="boardContent" class="form-control" rows="10" style="resize:none"></textarea>
						</div>
						<div class="form-group">
							<label for="boardFile">첨부 이미지</label>
							<input type="file" id="boardFile" name="boardFile" class="form-control" accept="image/*"/>
						</div>
						<div class="form-group">
							<div class="text-right">
								<button type="button" @click='checkInput' class="btn btn-primary">작성하기</button>
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
				boardSubject : '',
				boardContent : ''
			}
		}, 
		methods : {
			checkInput : function(){
				if(this.boardSubject.length == 0){
					alert("제목을 입력해주세요");
					$("#boardSubject").focus();
					return;
				}
				if(this.boardContent.length == 0){
					alert("내용을 입력해주세요");
					$("#boardContent").focus();
					return;
				}
				
				alert('저장되었습니다.');
				this.$router.push('/boardRead')
			}
		}
	}
</script>