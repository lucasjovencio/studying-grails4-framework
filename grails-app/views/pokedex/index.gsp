<!DOCTYPE html>
<html>
    <head>
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'pokedex.label', default: 'Pokedex')}" />
        <title><g:message code="default.list.label" args="[entityName]" /></title>
    </head>
    <body>
        <a href="#list-pokedex" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
        <div class="nav" role="navigation">
            <ul>
                <li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
                <li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
            </ul>
        </div>
        <div id="list-pokedex" class="content scaffold-list" role="main">
            <h1><g:message code="default.list.label" args="[entityName]" /></h1>
            <g:if test="${flash.message}">
                <div class="message" role="status">${flash.message}</div>
            </g:if>

            <table>
                <thead>
                    <tr>
                        <th>Nome</th>
                        <th>Vida</th>
                        <th>Ataque</th>
                        <th>Defesa</th>
                        <th>Velocidade</th>
                        <th>Vel. Ataque</th>
                        <th>Vel. Defesa</th>
                        <th>Tipos</th>
                        <th>Ações</th>
                    </tr>
                </thead>
                <tbody>
                    <g:each var="pokedex" in="${pokedexList}">
                        <tr>
                            <td>
                                <g:link action="show" id="${pokedex.id}">${pokedex.name}</g:link>
                            </td>
                            <td>${pokedex.hp}</td>
                            <td>${pokedex.attack}</td>
                            <td>${pokedex.defense}</td>
                            <td>${pokedex.speed}</td>
                            <td>${pokedex.speed_attack}</td>
                            <td>${pokedex.speed_defense}</td>
                            <td>
                                <ul>
                                    <g:each var="type" in="${pokedex.types}">
                                        <li>${type.name}</li>
                                    </g:each>
                                </ul>
                            </td>
                            <td>
                                <g:link action="edit" id="${pokedex.id}">Editar</g:link><br>
                            </td>
                        </tr>
                    </g:each>
                </tbody>
            </table>

            <div class="pagination">
                <g:paginate total="${pokedexCount ?: 0}" />
            </div>
        </div>
    </body>
</html>