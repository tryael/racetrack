
<%@ page import="racetrack.Race" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'race.label', default: 'Race')}" />
        <title><g:message code="default.list.label" args="[entityName]" /></title>
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></span>
            <span class="menuButton"><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></span>
            <span class="menuButton"><g:link action="search">Buscar por Carreras</g:link> </span>
        </div>
        <div class="body">
            <h1><g:message code="default.list.label" args="[entityName]" /></h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <div class="list">
                <table>
                    <thead>
                        <tr>

                            <g:sortableColumn property="name" title="${message(code: 'race.name.label', default: 'Name')}" />
                        
                            <g:sortableColumn property="startDateTime" title="${message(code: 'race.startDateTime.label', default: 'Start Date Time')}" />
                        
                            <g:sortableColumn property="city" title="${message(code: 'race.city.label', default: 'City')}" />
                        
                            <g:sortableColumn property="state" title="${message(code: 'race.state.label', default: 'State')}" />
                        
                            <g:sortableColumn property="distance" title="${message(code: 'race.distance.label', default: 'Distance')}" />
                        
                        </tr>
                    </thead>
                    <tbody>
                    <g:each in="${raceInstanceList}" status="i" var="raceInstance">
                        <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
                        
                            <td><g:link action="show" id="${raceInstance.id}">${fieldValue(bean: raceInstance, field: "name")}</g:link></td>
                        
                            <td><g:formatDate date="${raceInstance.startDateTime}" /></td>
                        
                            <td>${fieldValue(bean: raceInstance, field: "city")}</td>
                        
                            <td>${fieldValue(bean: raceInstance, field: "state")}</td>
                        
                            <td>${fieldValue(bean: raceInstance, field: "distance")}</td>
                        
                        </tr>
                    </g:each>
                    </tbody>
                </table>
            </div>
            <div class="paginateButtons">
                <g:paginate total="${raceInstanceTotal}" />
            </div>
        </div>
    </body>
</html>
