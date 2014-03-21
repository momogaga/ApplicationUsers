<%-- 
    Document   : index
    Created on : 13 mars 2014, 13:55:34
    Author     : MoMo
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<!-- Ne pas oublier cette ligne sinon tous les tags de la JSTL seront ignorés ! -->  
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%> 
<html>
    <head>  
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">  
        <title>Gestionnaire d'utilisateurs</title>  
    </head>  
    <body>  
        <!-- Message qui s'affiche lorsque la page est appelé avec un paramètre http message -->  
        <c:if test="${!empty param['message']}">  
            <h2>Reçu message : ${param.message}</h2>  
        </c:if>  


        <h2>Menu de gestion des utilisateurs</h2>  
        <ul>  
            <li><a href="ServletUsers?action=listerLesUtilisateurs">Afficher/raffraichir la liste de tous les utilisateurs</a></li>  
            <p>  
        </ul>  
         
        <ol>  
            <!--<li><a href="ServletUsers?action=creerUtilisateursDeTest">Créer 4 utilisateurs de test</a></li>-->  

            <li>Créer un utilisateur</li>  
            <form action="ServletUsers" method="get">  
                Nom : <input type="text" name="nom"/><br>  
                Prénom : <input type="text" name="prenom"/><br>  
                Login : <input type="text" name="login"/><br> 
                Password : <input type="text" name="password"/><br>
                <!-- Astuce pour passer des paramètres à une servlet depuis un formulaire JSP !-->  
                <input type="hidden" name="action" value="creerUnUtilisateur"/>  
                <button type="submit" name="submit"> Créer l'utilisateur</button>  
            </form>  

            <li>Afficher les détails d'un utilisateur</li>  
            <form action="ServletUsers" method="get">  
                login : <input type="text" name="login"/><br>  
                <input type="hidden" name="action" value="chercherParLogin"/>  
                <input type="submit" value="Chercher" name="submit"/>  
            </form>  


            <li>Modifier les détails d'un utilisateur :</li>  
            <form action="ServletUsers" method="get">  
                Login : <input type="text" name="login"/><br>  
                Nom : <input type="text" name="nom"/><br>  
                Prénom : <input type="text" name="prenom"/><br>  
                <input type="hidden" name="action" value="updateUtilisateur"/>  
                <input type="submit" value="Mettre à jour" name="submit"/>  
            </form>  
        </ol>  

        <!-- Fin du menu -->  

        <!-- Zone qui affiche les utilisateurs si le paramètre action vaut listerComptes -->  
        <c:if test="${param.action == 'listerLesUtilisateurs'}" >  
            <h2>Liste des utilisateurs</h2>  

            <table class="listing">  
                <!-- La ligne de titre du tableau des comptes -->  
                <tr>  
                    <td><b>Login</b></td>  
                    <td><b>Nom</b></td>  
                    <td><b>Prénom</b></td>  
                </tr>  

                <!-- Ici on affiche les lignes, une par utilisateur -->  
                <!-- cette variable montre comment on peut utiliser JSTL et EL pour calculer -->  
                <c:set var="total" value="0"/>  

                <c:forEach var="u" items="${listeDesUsers}" varStatus="status">  
                    <tr class="${status.index%2==0 ? 'alt' : ''}">  
                        <td>${u.login}</td>  
                        <td>${u.firstname}</td>  
                        <td>${u.lastname}</td>    
                        <!-- On compte le nombre de users -->  
                        <c:set var="total" value="${total+1}"/>  
                    </tr>  
                </c:forEach>  

                <!-- Affichage du solde total dans la dernière ligne du tableau -->  
                <tr>
                    <td><b>TOTAL</b></td>
                    <td></td>
                    <td><b>${total}</b></td>
                </tr>  
            </table>  
        </c:if>  
    </body>
</html>
