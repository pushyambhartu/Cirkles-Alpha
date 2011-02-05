
<%@ page import="cirkles.alpha.Cirkle" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'cirkle.label', default: 'Cirkle')}" />
        <title><g:message code="default.list.label" args="[entityName]" /></title>
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></span>
            <span class="menuButton"><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></span>
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
                        
                            <g:sortableColumn property="id" title="${message(code: 'cirkle.id.label', default: 'Id')}" />
                        
                            <g:sortableColumn property="name" title="${message(code: 'cirkle.name.label', default: 'Name')}" />
                        
                            <g:sortableColumn property="address" title="${message(code: 'cirkle.address.label', default: 'Address')}" />
                        
                            <g:sortableColumn property="dateCreated" title="${message(code: 'cirkle.dateCreated.label', default: 'Date Created')}" />
                        
                            <g:sortableColumn property="description" title="${message(code: 'cirkle.description.label', default: 'Description')}" />
                        
                            <g:sortableColumn property="lastUpdated" title="${message(code: 'cirkle.lastUpdated.label', default: 'Last Updated')}" />
                        
                        </tr>
                    </thead>
                    <tbody>
                    <g:each in="${cirkleInstanceList}" status="i" var="cirkleInstance">
                        <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
                        
                            <td><g:link action="show" id="${cirkleInstance.id}">${fieldValue(bean: cirkleInstance, field: "id")}</g:link></td>
                        
                            <td>${fieldValue(bean: cirkleInstance, field: "name")}</td>
                        
                            <td>${fieldValue(bean: cirkleInstance, field: "address")}</td>
                        
                            <td><g:formatDate date="${cirkleInstance.dateCreated}" /></td>
                        
                            <td>${fieldValue(bean: cirkleInstance, field: "description")}</td>
                        
                            <td><g:formatDate date="${cirkleInstance.lastUpdated}" /></td>
                        
                        </tr>
                    </g:each>
                    </tbody>
                </table>
            </div>
            <div class="paginateButtons">
                <g:paginate total="${cirkleInstanceTotal}" />
            </div>
        </div>
    </body>
</html>
