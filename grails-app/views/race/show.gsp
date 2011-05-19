
<%@ page import="racetrack.Race" %>
<html>
    <head>
        <g:javascript library="racetrack"/>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'race.label', default: 'Race')}" />
        <title><g:message code="default.show.label" args="[entityName]" /></title>
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></span>
            <span class="menuButton"><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></span>
            <span class="menuButton"><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></span>
        </div>
        <div class="body">
            <h1><g:message code="default.show.label" args="[entityName]" /></h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <div class="dialog">
                <table>
                    <tbody>

                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="race.name.label" default="Name" /></td>
                            <td valign="top" class="value">${fieldValue(bean: raceInstance, field: "name")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="race.startDateTime.label" default="Start Date Time" /></td>
                            
                            <td valign="top" class="value"><g:formatDate date="${raceInstance?.startDateTime}" format="dd - MMM - yyyy   HH:mm"/></td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="race.city.label" default="City" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: raceInstance, field: "city")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="race.state.label" default="State" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: raceInstance, field: "state")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="race.distance.label" default="Distance" /></td>
                            
                            <td valign="top" class="value"><g:formatNumber number="${raceInstance.distance}" format="##0.0 millas"/></td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="race.cost.label" default="Cost" /></td>
                            
                            <td valign="top" class="value"><g:formatNumber number="${raceInstance.cost}" format="\$##0.00"/></td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="race.maxRunners.label" default="Max Runners" /></td>
                            
                            <td valign="top" class="value"><g:formatNumber number="${raceInstance.maxRunners}" format="###,##0"/></td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="race.registrations.label" default="Registrations" /></td>
                            
                            <td valign="top" style="text-align: left;" class="value">
                                <ul>
                                <g:each in="${raceInstance.registrations}" var="r">
                                    <li><g:link controller="registration" action="show" id="${r.id}">${r?.encodeAsHTML()}</g:link></li>
                                </g:each>
                                </ul>
                            </td>
                            
                        </tr>
                    
                    </tbody>
                </table>
            </div>
            <div class="buttons">
                <g:form>
                    <g:hiddenField name="id" value="${raceInstance?.id}" />
                    <span class="button"><g:actionSubmit class="edit" action="edit" value="${message(code: 'default.button.edit.label', default: 'Edit')}" /></span>
                    <span class="button"><g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return warnBeforeRaceDelete();" /></span>
                </g:form>
            </div>
        </div>
    </body>
</html>
