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
							<input type="text" id="boardSubject" v-model="boardSubject" class="form-control" disabled="disabled"/>
						</div>
						<div class="form-group">
							<label for="boardContent">내용</label>
							<textarea id="boardContent" v-model="boardContent" class="form-control" rows="10" style="resize:none" disabled="disabled"></textarea>
						</div>
						<div class="form-group">
							<label for="boardFile">첨부 이미지</label>
							<img :src="boardImage" width="100%"/>
						</div>
						<div class="form-group">
							<div class="text-right">
								<router-link to="/boardMain" class="btn btn-primary">목록보기</router-link>
								<router-link to="/boardModify" class="btn btn-info">수정하기</router-link>
								<router-link to="/boardDelete" class="btn btn-danger">삭제하기</router-link>
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
				boardSubject : '새로운 내용',
				boardContent : '새로운 내용',
				boardImage : 'image/logo.png'
			}
		}	
	}

	function checkReply(){
		var replyContent = $("#replyContent").val();
		
		if(replyContent.length == 0){
			alert("댓글 내용을 입력해주세요");
			$("#replyContent").focus();
			return false;
		}
		
		return true;
	}
</script>