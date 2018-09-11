<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%

    //id 쿠키체크
    Cookie[] ck = request.getCookies();
    String chk = "";
    String id = "";
    if(ck != null) {
        for(int i = 0; i < ck.length; ++i) {
            String name = ck[i].getName();
            if(name.equals("uid")) {
                id = ck[i].getValue();
                break;
            }
        }
    }

    if(ck != null) {
        for(int i = 0; i < ck.length; ++i) {
            String name = ck[i].getName();
            if(name.equals("chk")) {
                chk = ck[i].getValue();
                break;
            }
        }
    }
%>