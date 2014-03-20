<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div class="header">

    <div>
       

        
            <c:if test="${empty login}">




                <form action="SessionLogin" method="post" class="navbar-form navbar-right" role="form">
                    <div class="form-group">
                        <input type="text" placeholder="" class="form-control" name="log" required="true">
                    </div>
                    <div class="form-group">
                        <input type="password" placeholder="Password" class="form-control" name="password" required="true">
                    </div>

                    <input type="hidden" name="action" value="logUser"/>  
                    <button type="submit" name="submit">log in</button>  

                </form>
            </c:if>
            <c:if test="${login ne null}">
               
                <div class="form-group">
                    <p><a href="Deconnecte">Déconnexion</a><br />
                Bonjour: ${login}
                </p>
                </div>
            </c:if> 
        
    </div>

    <h3 class="text-muted">Gestionnaire d'utilisateurs</h3>

</div>
