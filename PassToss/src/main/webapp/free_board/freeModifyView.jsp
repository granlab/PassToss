<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri = "http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
<title>사내게시판 글 수정 페이지</title>
<jsp:include page="../AdminPage/leftMenu.jsp"/>
<jsp:include page="../include/head.jsp"/>
<script src="js/modifyform.js"></script>
<script src="js/jquery-3.6.3.js"></script>
<style>
	.subject{
	    border-color : White;
		border-bottom : solid 1px silver; 
	}
	
	select {
	  padding: 1.5;
      margin: 5;
      margin-left: 10;
	}
	
	#upfile{display:none}
	
	img{
	  width:20px;
	  left-margin : 10px;	
	  margin: 10;
	}
	
	#board_content{
		border-color : White; 
		border-top : solid 1px silver;
	}
	
	.submit{ 
	  padding: 0.275rem 0.75rem;
	  /*border-color: black; border테두리*/
      border-radius: 1;
      margin: 5;
	}
	
	.cancel{
	  padding: 0.275rem 0.75rem;
	  border-color: black;
      border-radius: 1;
      margin: 5;
	}
	
	.container {
	width: 70%
	}
	
	textarea{
	 resize: none;
	}
</style>
</head>
<body>

  <div class='container box_radius15 board_container'>
	 <form action="FreeModifyAction.bof" method="post" enctype="multipart/form-data" name="modifyform">
	 	<input type="hidden" name="board_num" value="${board.board_num}">
	 	<input type="hidden" name="board_name" value="${board.board_name}">
	 	
	 	<h3>글 수정하기</h3>
	 	<div class="from-group">
    		 <c:if test="${id !='admin'}">
    		<select id="board_notice" name="board_notice"> <%-- 권한이 2거나 아이디가 admin 아니면 바꿀수 없어야함 --%>
				<option value="1" selected>게시물</option>
			</select>
		   </c:if>
		   <c:if test="${id=='admin'}">
		     <select id="board_notice" name="board_notice">
				<option value="0">공지사항</option>
				<option value="1" selected>게시물</option>
			 </select>
		   </c:if>
    	</div>
	 	
	 	<div class="form-group">
    		<label for="board_subject"></label>
    		<input name="board_subject" id="board_subject" maxlength="100"
    			   type="text" class="form-control subject" rows ="1"
    			   value="${board.board_subject}">
    	</div>
    	
    	
      <c:if test="${board.board_re_lev == 0}">
    	<div class="form-group">
    		<label>
    		 	<img src = "image/file.png" alt="파일첨부" width ="20px">
    			<input type="file" id="upfile" name="board_file">
    		</label>
    		<span id="filevalue">${board.board_file}</span>
    		<img src="image/remove.png" alt="파일삭제" width="10px" class="remove">
     	</div>
      </c:if>
      
      <div class="form-group">
    		<label for="board_content"></label>
    		<textarea name="board_content" id="board_content" rows="10"
    			   class="form-control">${board.board_content}</textarea>
      </div> 
      
      <div class="form-group">
      	<button type=submit class="btn btn-dark submit" style="float: right">수정</button>
    	<button type=reset class="btn btn-light cancel" onClick="history.go(-1)">취소</button>
      </div>
	 </form>
  </div>
</body>
</html>