package app.filters;

import java.io.IOException;

import javax.servlet.FilterChain;
import javax.servlet.ServletException;
import javax.servlet.http.HttpFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class Filters extends HttpFilter {

	@Override
	protected void doFilter(HttpServletRequest req, HttpServletResponse res, FilterChain chain)
			throws IOException, ServletException {
		HttpSession session = req.getSession();
		String uri = req.getRequestURI();
		if (session.getAttribute("auth") != null) {
			chain.doFilter(req, res);
		} else {
			System.out.println(uri);
			switch (uri.substring(req.getContextPath().length())) {
			default:
				String query = req.getQueryString();
				String origin = uri.substring(req.getContextPath().length()) +(query != null ? "?"+query : "");
				session.setAttribute("origin", origin);
				res.sendRedirect(req.getContextPath() + "/index.do");
				break;
			case "/index.do":
			case "/login.do":
			case "/board/detail.do":
			case "/find_user.do":
			case "/find_pass.do":
			case "/join.do":
			case "/mail.do":
			case "/emailauth.do":
			case "/joinid_check.do":
			case "/joinemail_check.do":
			case "/searchList.do":
			case "/board/list.do":
			case "/board/lists.do":
			case "/waiting.do":
			case "/ajax/replylist.do":
				chain.doFilter(req, res);
				break;
			}

		}

	}

}
