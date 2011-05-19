<%--
  Created by IntelliJ IDEA.
  User: ARIK
  Date: 11-05-11
  Time: 05:58 PM
  To change this template use File | Settings | File Templates.
--%>

<%@ page contentType="text/html;charset=UTF-8" %>
<html>
  <head>
      <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
      <meta name="layout" content="main"/>
      <title>Buscar por Carreras</title>
  </head>
  <body>
    <div class="body">
        <h1>Buscar por Carreras</h1>
        <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
        </g:if>

        <g:form action="search" method="post">
            <div class="dialog">
                <table>
                    <tr class="prop">
                        <td valign="top" class="name">
                            <label for="city"><g:message code="race.city.label" default="City:" /></label>
                        </td>
                        <td valign="top" class="value ${hasErrors(bean: raceInstance, field: 'city', 'errors')}">
                            <g:textField name="city" value="${raceInstance?.city}" />
                        </td>
                    </tr>
                    <tr class='prop'>
                        <td valign='top' class='name'>
                            <label for='state'>State:</label>
                        </td>
                        <td valign='top' class='value'>
                            <g:select name='state'
                                    from='${[" "] + new racetrack.Race().constraints.state.inList}'>
                            </g:select>
                        </td>
                    </tr>
                    <tr class="prop">
                        <td valign="top" class="name">
                            <label for='date'>Date:</label>
                        </td>
                        <td valign="top" class="value">
                            between
                            <g:datePicker name="minDate" precision="day"/>
                            and
                            <g:datePicker name="maxDate" precision="day" value="${new Date().plus(365*2)}"/>
                        </td>
                    </tr>
                    <tr class="prop">
                        <td valign="top" class="name">
                            <label for="distance">Distance:</label>
                        </td>
                        <td valign="top" class="value">
                            <select name="distanceOperator">
                                <option value="AT_LEAST">At least</option>
                                <option value="EXACTLY">Exactly</option>
                                <option value="AT_MOST">At most</option>
                            </select>
                            <input type='text' name="distance" size="5">
                            </input> millas
                        </td>
                    </tr>



                </table>
            </div>
            <div class="buttons">
                <span class="button"><g:actionSubmit class="search" action="search" value="Buscar" /></span>
            </div>
        </g:form>
    </div>
  </body>
</html>