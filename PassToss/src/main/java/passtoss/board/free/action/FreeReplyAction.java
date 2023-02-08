package passtoss.board.free.action;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import passtoss.board.free.db.FreeBoard;
import passtoss.board.free.db.FreeBoardDAO;

public class FreeReplyAction implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		ActionForward forward = new ActionForward();
		FreeBoardDAO fdao = new FreeBoardDAO();
		FreeBoard board = new FreeBoard(); 
		int result = 0;
		
		board.setBoard_name(request.getParameter("board_name"));
		board.setBoard_subject(request.getParameter("board_subject"));
		board.setBoard_content(request.getParameter("board_content"));
		board.setBoard_re_ref(Integer.parseInt(request.getParameter("board_re_ref")));
		board.setBoard_re_lev(Integer.parseInt(request.getParameter("board_re_lev")));
		board.setBoard_re_seq(Integer.parseInt(request.getParameter("board_re_seq")));
		
		result = fdao.boardReply(board);
		
		if(result == 0) {
			
			System.out.println("답글 등록 실패");
			forward = new ActionForward();
			forward.setRedirect(false);
			request.setAttribute("message", "답글 등록 실패입니다.");
			forward.setPath("error/error.jsp");
			return forward;
		}
		
		System.out.println("답글 등록 성공");
		forward.setRedirect(true);
		forward.setPath("FreeDetailAction.bof?num="+result);
		return forward;
	}

}
