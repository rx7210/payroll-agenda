/*
 * COPYRIGHT. HSBC HOLDINGS PLC 2017. ALL RIGHTS RESERVED.
 * 
 * This software is only to be used for the purpose for which it has been
 * provided. No part of it is to be reproduced, disassembled, transmitted,
 * stored in a retrieval system nor translated in any human or computer
 * language in any way or for any other purposes whatsoever without the prior
 * written consent of HSBC Holdings plc.
 */
package com.hsbc.hbmx.payroll.agenda.utils;

import com.hsbc.hbmx.payroll.agenda.beans.User;

/**
 * <p>
 * <b> ComponentsHtml. </b>
 * </p>
 */
public class ComponentsHtml {


    /**
     * <p>
     * <b> Generate the Head Bar. </b>
     * </p>
     * 
     * @param userId
     *            User ID
     * @param userName
     *            User name
     * @param roleName
     *            User role
     * @return String Head bar
     */
    public final String headBar(final User user) {
        final StringBuffer headBar = new StringBuffer("<div class=\"headBar\">");
        headBar.append("<div class=\"headLabel\">");
        headBar.append("<table style=\"color: #FFFFFF;\" class=\"arial12\">");
        headBar.append("<tr><td width=\"120\">Bienvenido</td>");
        headBar.append("<td width=\"180\">Registro: " + user.getUserId() + "</td>");
        headBar.append("<td width=\"400\">Nombre: " + user.getUserName().toUpperCase() + "</td>");
        headBar.append("<td width=\"200\">Perfil: " + user.getRole().getRoleName().toUpperCase() + "</td>");
        headBar.append("</tr></table></div></div>");
        headBar.append("<div class=\"menu_bar\"><img src=\"/payroll-agenda/statics/images/icon-menu.jpg\"></div>");
        headBar
            .append("<div style=\"left: 50px; top: 50px; position: absolute;\"><img src=\"/payroll-agenda/statics/images/logoWhite.png\"></div>");

        return headBar.toString();
    }

    /**
     * <p>
     * <b> Generate div of title. </b>
     * </p>
     * 
     * @param titleName
     *            Title name
     * @return String Div to show in page
     */
    public final String titleSection(final String titleName) {
        final StringBuffer divTitleSection = new StringBuffer("<div class=\"titSection\">");
        divTitleSection.append("<table class=\"arial12\">");
        divTitleSection.append("<tr height=\"30\" valign=\"bottom\">");
        divTitleSection.append("<td align=\"left\"><b>" + titleName + "</b></td>");
        divTitleSection.append("</tr></table><hr></div>");

        return divTitleSection.toString();
    }

    /**
     * <p>
     * <b> Generate div with message of error or confirm. </b>
     * </p>
     * 
     * @param message
     *            Message
     * @param isError
     *            True = is error False is not error
     * @return String Div to show in page
     */
    public final String printMessage(final String message, final boolean isError) {
        String background = "#EAF1E9";
        String borderColor = "gren";
        String img = "iconConfirmed.gif";
        String table = "<table class=\"arial11\">";

        if (isError) {
            background = "#FBE6E8";
            borderColor = "red";
            img = "errorsCritical.gif";
            table = "<table class=\"arial11Red\">";
        }

        final StringBuffer divMessage = new StringBuffer("<div id=\"msgsApp\" style=\"background: " + background
            + "; border-color: " + borderColor + ";\" class=\"messages\">");
        divMessage.append(table);
        divMessage
            .append("<tr><td colspan=\"2\"><input type=\"image\" src=\"/payroll-agenda/statics/images/iconClose.gif\" onclick=\"hideDiv('msgsApp')\"></td></tr>");
        divMessage.append("<tr class=\"arial12\" valign=\"middle\">");
        divMessage.append("<td >&nbsp;<img src=\"/payroll-agenda/statics/images/" + img + "\">&nbsp;&nbsp;</td>");
        divMessage.append("<td>" + message + "</td>");
        divMessage.append("</tr></table></div>");

        return divMessage.toString();
    }

    public final String searcher() {
        final StringBuffer searcherSection = new StringBuffer("<div id=\"searcherDiv\" class=\"searcher\">");
        searcherSection.append("<form id=\"searchForm\" name=\"searchForm\" ");
        searcherSection.append("action=\"/payroll-agenda/search\" method=\"post\">");
        searcherSection.append("<select id=\"searchType\" name=\"searchType\" class=\"arial11 col-xs-5\">");
        searcherSection.append("<option value=\"1\">Usuario</option>");
        searcherSection.append("<option value=\"2\">POC</option>");
        searcherSection.append("<option value=\"3\">Centro de trabajo</option>");
        searcherSection.append("<option value=\"4\">Sucursal</option>");
        searcherSection.append("<option value=\"5\">Cuenta</option>");
        searcherSection.append("</select> <input type=\"text\" id=\"searchValue\" name=\"searchValue\" ");
        searcherSection.append("class=\"arial11 col-xs-6\" value=\"\" size=\"25\"> <input type=\"image\" ");
        searcherSection.append("id=\"imgSearch\" name=\"imgSearch\" src=\"/payroll-agenda/statics/images/magnifying-black.png\">");
        searcherSection.append("</form></div>");
        searcherSection.append("<div id=\"respSearch\" class=\"respSearcher\">");
        searcherSection.append("<input type=\"image\" id=\"imgClose\" ");
        searcherSection.append("src=\"/payroll-agenda/statics/images/iconClose.gif\" onclick=\"hideDiv('respSearch')\">");
        searcherSection.append("<span class=\"arial11Red\" id=\"response\"></span>");
        searcherSection.append("</div>");

        return searcherSection.toString();
    }
}
