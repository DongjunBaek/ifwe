/*
 * Generated by the Jasper component of Apache Tomcat
 * Version: Apache Tomcat/8.5.50
 * Generated at: 2020-03-15 16:36:31 UTC
 * Note: The last modified time of this file was set to
 *       the last modified time of the source file after
 *       generation to assist with modification tracking.
 */
package org.apache.jsp.WEB_002dINF.views.common;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;

public final class clubInclude_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent,
                 org.apache.jasper.runtime.JspSourceImports {

  private static final javax.servlet.jsp.JspFactory _jspxFactory =
          javax.servlet.jsp.JspFactory.getDefaultFactory();

  private static java.util.Map<java.lang.String,java.lang.Long> _jspx_dependants;

  private static final java.util.Set<java.lang.String> _jspx_imports_packages;

  private static final java.util.Set<java.lang.String> _jspx_imports_classes;

  static {
    _jspx_imports_packages = new java.util.HashSet<>();
    _jspx_imports_packages.add("javax.servlet");
    _jspx_imports_packages.add("javax.servlet.http");
    _jspx_imports_packages.add("javax.servlet.jsp");
    _jspx_imports_classes = null;
  }

  private volatile javax.el.ExpressionFactory _el_expressionfactory;
  private volatile org.apache.tomcat.InstanceManager _jsp_instancemanager;

  public java.util.Map<java.lang.String,java.lang.Long> getDependants() {
    return _jspx_dependants;
  }

  public java.util.Set<java.lang.String> getPackageImports() {
    return _jspx_imports_packages;
  }

  public java.util.Set<java.lang.String> getClassImports() {
    return _jspx_imports_classes;
  }

  public javax.el.ExpressionFactory _jsp_getExpressionFactory() {
    if (_el_expressionfactory == null) {
      synchronized (this) {
        if (_el_expressionfactory == null) {
          _el_expressionfactory = _jspxFactory.getJspApplicationContext(getServletConfig().getServletContext()).getExpressionFactory();
        }
      }
    }
    return _el_expressionfactory;
  }

  public org.apache.tomcat.InstanceManager _jsp_getInstanceManager() {
    if (_jsp_instancemanager == null) {
      synchronized (this) {
        if (_jsp_instancemanager == null) {
          _jsp_instancemanager = org.apache.jasper.runtime.InstanceManagerFactory.getInstanceManager(getServletConfig());
        }
      }
    }
    return _jsp_instancemanager;
  }

  public void _jspInit() {
  }

  public void _jspDestroy() {
  }

  public void _jspService(final javax.servlet.http.HttpServletRequest request, final javax.servlet.http.HttpServletResponse response)
      throws java.io.IOException, javax.servlet.ServletException {

    final java.lang.String _jspx_method = request.getMethod();
    if (!"GET".equals(_jspx_method) && !"POST".equals(_jspx_method) && !"HEAD".equals(_jspx_method) && !javax.servlet.DispatcherType.ERROR.equals(request.getDispatcherType())) {
      response.sendError(HttpServletResponse.SC_METHOD_NOT_ALLOWED, "JSPs only permit GET POST or HEAD");
      return;
    }

    final javax.servlet.jsp.PageContext pageContext;
    javax.servlet.http.HttpSession session = null;
    final javax.servlet.ServletContext application;
    final javax.servlet.ServletConfig config;
    javax.servlet.jsp.JspWriter out = null;
    final java.lang.Object page = this;
    javax.servlet.jsp.JspWriter _jspx_out = null;
    javax.servlet.jsp.PageContext _jspx_page_context = null;


    try {
      response.setContentType("text/html; charset=UTF-8");
      pageContext = _jspxFactory.getPageContext(this, request, response,
      			null, true, 8192, true);
      _jspx_page_context = pageContext;
      application = pageContext.getServletContext();
      config = pageContext.getServletConfig();
      session = pageContext.getSession();
      out = pageContext.getOut();
      _jspx_out = out;

      out.write("\r\n");
      out.write("<!DOCTYPE html>\r\n");
      out.write("<script>\r\n");
      out.write("$(function(){\r\n");
      out.write("    $(\"#nav-arrowicon\").click(function(){\r\n");
      out.write("        $(\"#nav-mypagebox\").slideToggle(300);\r\n");
      out.write("    });\r\n");
      out.write("\r\n");
      out.write("    $(window).scroll(function(event){\r\n");
      out.write("    if(jQuery(window).scrollTop() > jQuery(\".aside-scroll-box\").offset().top) {\r\n");
      out.write("    jQuery(\"#aside-scroll\").css(\"position\", \"absolute\").css(\"top\",jQuery(window).scrollTop());\r\n");
      out.write("    }\r\n");
      out.write("    else if((jQuery(window).scrollTop() < jQuery(\".aside-scroll-box\").offset().top)) {\r\n");
      out.write("    jQuery(\"#aside-scroll\").css(\"position\", \"static\");\r\n");
      out.write("    }\r\n");
      out.write("    });\r\n");
      out.write("    \r\n");
      out.write("    $(\"#mypagebutton\").click(function(){\r\n");
      out.write("    \tlocation.href=\"");
      out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.proprietaryEvaluate("${pageContext.request.contextPath }", java.lang.String.class, (javax.servlet.jsp.PageContext)_jspx_page_context, null));
      out.write("/member/mypage.do\";\r\n");
      out.write("    });\r\n");
      out.write("    \r\n");
      out.write("    $(\".logo-box\").click(function(){\r\n");
      out.write("    \tlocation.href=\"");
      out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.proprietaryEvaluate("${pageContext.request.contextPath }", java.lang.String.class, (javax.servlet.jsp.PageContext)_jspx_page_context, null));
      out.write("/index/mainpage.do\";\r\n");
      out.write("    })\r\n");
      out.write("    \r\n");
      out.write("    \r\n");
      out.write("})\r\n");
      out.write("\r\n");
      out.write("</script>\r\n");
      out.write(" <div class=\"wrapper\">\r\n");
      out.write("        <nav>\r\n");
      out.write("            <div class=\"nav-container\">\r\n");
      out.write("                <div class=\"logo-box\"></div>\r\n");
      out.write("                <div class=\"nav-content-right\">\r\n");
      out.write("                    <div class=\"nav-right-icon2\">\r\n");
      out.write("                        <i class=\"fas fa-bell\" style=\"font-size:35px;\"></i>\r\n");
      out.write("                    </div>\r\n");
      out.write("                    <div class=\"nav-right-icon1\" id=\"nav-arrowicon\">\r\n");
      out.write("                        <i class=\"fas fa-sort-down fa-2x\"></i>\r\n");
      out.write("                    </div>\r\n");
      out.write("                    <div class=\"nav-clubimg\">\r\n");
      out.write("\t\t\t\t\t\t<img src=\"");
      out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.proprietaryEvaluate("${pageContext.request.contextPath }", java.lang.String.class, (javax.servlet.jsp.PageContext)_jspx_page_context, null));
      out.write("/resources/upload/member/frofileimg/ex2.jpg\" alt=\"\" />\r\n");
      out.write("                    </div>\r\n");
      out.write("                        <div class=\"nav-right-leader\">\r\n");
      out.write("                            <p>@wingStudy_02</p>\r\n");
      out.write("                            <p>스테파니 님</p>\r\n");
      out.write("                        </div>\r\n");
      out.write("                </div>\r\n");
      out.write("            </div>\r\n");
      out.write("            <div class=\"nav-myfrofile-box\" id=\"nav-mypagebox\">\r\n");
      out.write("                <p id=\"mypagebutton\">마이페이지</p>\r\n");
      out.write("                <div class=\"nav-box-line\"></div>\r\n");
      out.write("                <p id=\"logoutbutton\">로그아웃</p>\r\n");
      out.write("            </div>\r\n");
      out.write("        </nav>\r\n");
      out.write("        <div class=\"wrapper-content\">\r\n");
      out.write("            <aside class=\"flotclass\">\r\n");
      out.write("                <div class=\"aside-icon-arrow\">\r\n");
      out.write("                        <i class=\"fas fa-arrow-left\" style=\"font-size:40px;\"></i>\r\n");
      out.write("                </div>\r\n");
      out.write("                <div class=\"aside-leader-img\">\r\n");
      out.write("                \t<img src=\"");
      out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.proprietaryEvaluate("${pageContext.request.contextPath }", java.lang.String.class, (javax.servlet.jsp.PageContext)_jspx_page_context, null));
      out.write("/resources/upload/member/frofileimg/ex2.jpg\" alt=\"\" />\r\n");
      out.write("                </div>\r\n");
      out.write("                <div class=\"aside-leader-information\">\r\n");
      out.write("                    <p class=\"aside-leader-allias\">스테파니</p>\r\n");
      out.write("                    <i class=\"fas fa-crown\" style=\"font-size:20pt;\"></i>\r\n");
      out.write("                    <p class=\"aside-leader-id\">@wingStudy_02</p>\r\n");
      out.write("                </div>\r\n");
      out.write("                <div class=\"aside-join\">\r\n");
      out.write("                    <p>가입하기</p>\r\n");
      out.write("                </div>\r\n");
      out.write("         <div class=\"aside-scroll-box\">\r\n");
      out.write("          \t<div id=\"aside-scroll\">\r\n");
      out.write("                <div class=\"aside-boardmenu\">\r\n");
      out.write("                        <p><i class=\"fas fa-circle\" style=\"font-size: 10px;color:#ffc862\"></i>&nbsp;&nbsp;&nbsp;공지사항</p>\r\n");
      out.write("                        <p><i class=\"fas fa-circle\" style=\"font-size: 10px;color:#ffc862\"></i>&nbsp;&nbsp;&nbsp;일정캘린더</p>\r\n");
      out.write("                        <p><i class=\"fas fa-circle\" style=\"font-size: 10px;color:#ffc862\"></i>&nbsp;&nbsp;&nbsp;자유게시판</p>\r\n");
      out.write("                </div>\r\n");
      out.write("                <div class=\"aside-friend-box\">\r\n");
      out.write("                    <div class=\"aside-friend-title\">\r\n");
      out.write("                        <p>친구 목록</p>\r\n");
      out.write("                        <div class=\"aside-friend-count\"><p>23명</p></div>\r\n");
      out.write("                    </div>\r\n");
      out.write("                    <div class=\"aside-friend-list\">\r\n");
      out.write("                        <div class=\"aside-friend\">\r\n");
      out.write("                            <div class=\"fried-profileimg\">\r\n");
      out.write("                            \t<img src=\"");
      out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.proprietaryEvaluate("${pageContext.request.contextPath }", java.lang.String.class, (javax.servlet.jsp.PageContext)_jspx_page_context, null));
      out.write("/resources/upload/member/frofileimg/ex2.jpg\" alt=\"\" />\r\n");
      out.write("                            </div>\r\n");
      out.write("                            <p class=\"friendname\">김원재</p>\r\n");
      out.write("                        </div>\r\n");
      out.write("                        <div class=\"aside-friend\">\r\n");
      out.write("                            <div class=\"fried-profileimg\">\r\n");
      out.write("                            \t<img src=\"");
      out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.proprietaryEvaluate("${pageContext.request.contextPath }", java.lang.String.class, (javax.servlet.jsp.PageContext)_jspx_page_context, null));
      out.write("/resources/upload/member/frofileimg/ex2.jpg\" alt=\"\" />\r\n");
      out.write("                            </div>\r\n");
      out.write("                            <p class=\"friendname\">김원재</p>\r\n");
      out.write("                        </div>\r\n");
      out.write("                        <div class=\"aside-friend\">\r\n");
      out.write("                            <div class=\"fried-profileimg\">\r\n");
      out.write("                            \t<img src=\"");
      out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.proprietaryEvaluate("${pageContext.request.contextPath }", java.lang.String.class, (javax.servlet.jsp.PageContext)_jspx_page_context, null));
      out.write("/resources/upload/member/frofileimg/ex2.jpg\" alt=\"\" />\r\n");
      out.write("                            </div>\r\n");
      out.write("                            <p class=\"friendname\">김원재</p>\r\n");
      out.write("                        </div>\r\n");
      out.write("                        <div class=\"aside-friend\">\r\n");
      out.write("                            <div class=\"fried-profileimg\">\r\n");
      out.write("                            \t<img src=\"");
      out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.proprietaryEvaluate("${pageContext.request.contextPath }", java.lang.String.class, (javax.servlet.jsp.PageContext)_jspx_page_context, null));
      out.write("/resources/upload/member/frofileimg/ex2.jpg\" alt=\"\" />\r\n");
      out.write("                            </div>\r\n");
      out.write("                            <p class=\"friendname\">김원재</p>\r\n");
      out.write("                        </div>\r\n");
      out.write("                        <div class=\"aside-friend\">\r\n");
      out.write("                            <div class=\"fried-profileimg\">\r\n");
      out.write("                            \t<img src=\"");
      out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.proprietaryEvaluate("${pageContext.request.contextPath }", java.lang.String.class, (javax.servlet.jsp.PageContext)_jspx_page_context, null));
      out.write("/resources/upload/member/frofileimg/ex2.jpg\" alt=\"\" />\r\n");
      out.write("                            </div>\r\n");
      out.write("                            <p class=\"friendname\">김원재</p>\r\n");
      out.write("                        </div>\r\n");
      out.write("                        <div class=\"aside-friend\">\r\n");
      out.write("                            <div class=\"fried-profileimg\">\r\n");
      out.write("                            \t<img src=\"");
      out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.proprietaryEvaluate("${pageContext.request.contextPath }", java.lang.String.class, (javax.servlet.jsp.PageContext)_jspx_page_context, null));
      out.write("/resources/upload/member/frofileimg/ex2.jpg\" alt=\"\" />\r\n");
      out.write("                            </div>\r\n");
      out.write("                            <p class=\"friendname\">김원재</p>\r\n");
      out.write("                        </div>\r\n");
      out.write("                   </div>\r\n");
      out.write("              </div>\r\n");
      out.write("         </div>\r\n");
      out.write("     </div>\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("            </aside>\r\n");
      out.write("            <header class=\"flotclass\">\r\n");
      out.write("                <div class=\"header-search-box\">\r\n");
      out.write("                    <div class=\"header-icon\">\r\n");
      out.write("                        <i class=\"fas fa-search\" style=\"font-size:35px;\"></i>\r\n");
      out.write("                    </div>\r\n");
      out.write("                        <input type=\"text\" name=\"search\" id=\"search\" placeholder=\"검색어를 입력하세요\">\r\n");
      out.write("                </div>\r\n");
      out.write("                <div class=\"header-titleimg\">\r\n");
      out.write("                    <div class=\"header-titleimg-cover\">\r\n");
      out.write("                        <div class=\"header-title-left\">\r\n");
      out.write("                            <p class=\"header-title1\">윙스터디 모임</p>\r\n");
      out.write("                            <p class=\"header-title2\">강남역 스터디모임에서 같이공부해요!</p>\r\n");
      out.write("                        </div>\r\n");
      out.write("                        <div class=\"header-title-right\">\r\n");
      out.write("                            <p>서울,경기</p>\r\n");
      out.write("                            <div class=\"header-location-icon\">\r\n");
      out.write("                                <i class=\"fas fa-map-marker-alt\" style=\"font-size: 30px;\"></i>\r\n");
      out.write("                            </div>\r\n");
      out.write("                        </div>\r\n");
      out.write("\r\n");
      out.write("                    </div>\r\n");
      out.write("                </div>\r\n");
      out.write("            </header>\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
    } catch (java.lang.Throwable t) {
      if (!(t instanceof javax.servlet.jsp.SkipPageException)){
        out = _jspx_out;
        if (out != null && out.getBufferSize() != 0)
          try {
            if (response.isCommitted()) {
              out.flush();
            } else {
              out.clearBuffer();
            }
          } catch (java.io.IOException e) {}
        if (_jspx_page_context != null) _jspx_page_context.handlePageException(t);
        else throw new ServletException(t);
      }
    } finally {
      _jspxFactory.releasePageContext(_jspx_page_context);
    }
  }
}
