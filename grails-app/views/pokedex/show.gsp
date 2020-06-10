<!DOCTYPE html>
<html>
    <head>
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'pokedex.label', default: 'Pokedex')}" />
        <title><g:message code="default.show.label" args="[entityName]" /></title>
    </head>
    <body>
        <a href="#show-pokedex" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
        <div class="nav" role="navigation">
            <ul>
                <li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
                <li><g:link class="list" action="index"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
                <li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
            </ul>
        </div>
        <div id="show-pokedex" class="content scaffold-show" role="main">
            <h1><g:message code="default.show.label" args="[entityName]" /></h1>
            <g:if test="${flash.message}">
                <div class="message" role="status">${flash.message}</div>
            </g:if>

            <fieldset>
                <div class="row">
                    <div class="col-8">
                        <div class="row">
                            <div class="form-group col-6">
                                <label>Nome</label>
                                <input type="text" name="nome" class="form-control" value="${pokedex.name}" placeholder="Nome" readonly>
                            </div>

                            <div class="form-group col-3">
                                <label>Vida</label>
                                <input type="text" name="hp" class="form-control" value="${pokedex.hp}" placeholder="Nome" readonly>
                            </div>

                            <div class="form-group col-3">
                                <label>Ataque</label>
                                <input type="text" name="attack" class="form-control" value="${pokedex.attack}" placeholder="Nome" readonly>
                            </div>

                            <div class="form-group col-6">
                                <label>Defesa</label>
                                <input type="text" name="defense" class="form-control" value="${pokedex.defense}" placeholder="Nome" readonly>
                            </div>

                            <div class="form-group col-6">
                                <label>Velocidade</label>
                                <input type="text" name="speed" class="form-control" value="${pokedex.speed}" placeholder="Nome" readonly>
                            </div>

                            <div class="form-group col-6">
                                <label>Velocidade de ataque</label>
                                <input type="text" name="speed_attack" class="form-control" value="${pokedex.speed_attack}" placeholder="Nome" readonly>
                            </div>

                            <div class="form-group col-6">
                                <label>Velocidade de defesa</label>
                                <input type="text" name="speed_defense" class="form-control" value="${pokedex.speed_defense}" placeholder="Nome" readonly>
                            </div>
                        </div>
                    </div>
                    <div class="col-4">
                        <div class="row">
                            <div class="col-12">
                                <label>Tipos</label>
                                <ul style="margin-left: 30px;">
                                    <g:each var="type" in="${pokedex.types}">
                                        <li>${type.name}</li>
                                    </g:each>
                                </ul>
                            </div>
                        </div>
                    </div>
                </div>

            </fieldset>
            
            <g:form resource="${this.pokedex}" method="DELETE">
                <fieldset class="buttons">
                    <g:link class="edit" action="edit" resource="${this.pokedex}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
                    <input class="delete" type="submit" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
                </fieldset>
            </g:form>
        </div>
    </body>
</html>
