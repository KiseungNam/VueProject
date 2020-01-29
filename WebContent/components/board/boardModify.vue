<template>
	<div class="container" style="margin-top:100px">
		<div class="row">
			<div class="col-sm-3"></div>
			<div class="col-sm-6">
				<div class="card shadow">
					<div class="card-body">
						<div class="form-group">
							<label for="boardWriterName">작성자</label>
							<input type="text" id="boardWriterName" v-model="boardWriterName" class="form-control" disabled="disabled"/>
						</div>
						<div class="form-group">
							<label for="boardDate">작성날짜</label>
							<input type="text" id="boardDate" v-model="boardDate" class="form-control" disabled="disabled"/>
						</div>
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
							<img :src="boardImage" width="100%"/>
							<input type="file" name="boardFile" id="boardFile" class="form-control" accept="image/*"/>
						</div>
						<div class="form-group">
							<div class="text-right">
								<button type="button" @click='checkInput' class="btn btn-primary">수정완료</button>
								<router-link to="/boardRead" class="btn btn-info">취소</router-link>
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
				boardWriterName : '새로운 작성자',
				boardDate : '2019-12-06',
				boardSubject : '새로운 제목',
				boardContent : '새로운 내용',
				boardImage : 'image/logo.png'
			}
		}, methods : {
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
				
				alert('수정되었습니다.');
				this.$router.push('/boardRead');
			}
		}
	}
</script>