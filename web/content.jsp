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
        <c:if test="${login ne null}">

            <!-- Message qui s'affiche lorsque la page est appelé avec un paramètre http message   
            <c:if test="${!empty param['message']}">  
                <h2>Reçu message : ${param.message}</h2>  
            </c:if>  -->

            <div class="row">
                <div class="col-md-2 sidebar">
                    <ul class="nav nav-tabs nav-pills nav-stacked" id="MyTab">
                        <li class="active"><a href="#raffraichir" data-toggle="tab">Afficher</a></li>
                        <li><a href="#ajouter" data-toggle="tab">Crée</a></li>
                        <li><a href="#rechercher" data-toggle="tab">Rechercher</a></li>
                        <li><a href="#modifier" data-toggle="tab">Mettre à jour</a></li>
                    </ul>
                </div>

                <div class="col-md-10 main">
                    <!-- Tab panes -->
                    <div class="tab-content">
                        <div class="tab-pane active" id="raffraichir">
                            <legend><a href="ServletUsers?action=listerLesUtilisateurs">Afficher/raffraichir la liste de tous les utilisateurs</a></legend>
                            <ul>  
                                <!--<li><a href="ServletUsers?action=listerLesUtilisateurs">Afficher/raffraichir la liste de tous les utilisateurs</a></li>-->  
                                <!--<li><a href="ServletUsers?action=creerUtilisateursDeTest">Créer 4 utilisateurs de test</a></li>-->  
                             
                            </ul>  
                            <!-- Zone qui affiche les utilisateurs si le paramètre action vaut listerComptes -->  
                            <c:if test="${param.action == 'listerLesUtilisateurs'}" >  
                               
                                <form action="ServletUsers" method="get"> 
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
                                                <td>${u.lastname}</td> 
                                                <td>${u.firstname}</td>                                            

                                                <td><input type="checkbox" value="${u.id}" name="id"/></td>
                                                <!-- On compte le nombre de users -->  
                                                <c:set var="total" value="${total+1}"/>  
                                            </tr>  
                                        </c:forEach>  

                                        <!-- Affichage du solde total dans la dernière ligne du tableau -->  
                                        <tr>
                                            <td><b>TOTAL</b></td>
                                            <td></td><td></td>
                                            <td><b>${total}</b></td>
                                        </tr>  
                                    </table>  
                                    <br />
                                    <input type="hidden" name="action" value="supprimerUnUtilisateur"/> 
                                    <button type="submit" name="submit" class="btn btn-danger">Supprimer l'utilisateur</button> 

                                </form>
                            </c:if>  
                        </div>
                        <div class="tab-pane" id="ajouter">
                            <form class="form-horizontal" action="ServletUsers" method="get">
                                <fieldset>

                                    <legend>Ajouter un utilisateur</legend>

                                    <div class="form-group">
                                        <label class="col-md-4 control-label" for="nom">Nom :</label>  
                                        <div class="col-md-4">
                                            <input id="nom" name="nom" type="text" placeholder="" class="form-control input-md" required="">
                                        </div>
                                    </div>

                                    <div class="form-group">
                                        <label class="col-md-4 control-label" for="prenom">Prénom :</label>  
                                        <div class="col-md-4">
                                            <input id="prenom" name="prenom" type="text" placeholder="" class="form-control input-md" required="">
                                        </div>
                                    </div>

                                    <div class="form-group">
                                        <label class="col-md-4 control-label" for="login">Login :</label>  
                                        <div class="col-md-4">
                                            <input id="login" name="login" type="text" placeholder="" class="form-control input-md" required="">
                                        </div>
                                    </div>

                                    <div class="form-group">
                                        <label class="col-md-4 control-label" for="password">Password :</label>  
                                        <div class="col-md-4">
                                            <input id="password" name="password" type="text" placeholder="" class="form-control input-md" required="">
                                        </div>
                                    </div>

                                    <div class="form-group">
                                        <div class="col-md-4">
                                            <!-- Astuce pour passer des paramètres à une servlet depuis un formulaire JSP !-->  
                                            <input type="hidden" name="action" value="creerUnUtilisateur"/> 
                                            <button type="submit" name="submit"  class="btn btn-info">Création de l'utilsateur</button>
                                        </div>
                                    </div>

                                </fieldset>
                            </form> 
                        </div>
                        <div class="tab-pane" id="rechercher">

                            <form class="form-horizontal" action="ServletUsers" method="get">
                                <fieldset>

                                    <legend>Rechercher un utilisateur</legend>

                                    <div class="form-group">
                                        <label class="col-md-4 control-label" for="login">Login :</label>  
                                        <div class="col-md-4">
                                            <input id="login" name="login" type="text" placeholder="" class="form-control input-md" required="">
                                        </div>
                                    </div>

                                    <div class="form-group">
                                        <div class="col-md-4">
                                            <!-- Astuce pour passer des paramètres à une servlet depuis un formulaire JSP !-->  
                                            <input type="hidden" name="action" value="chercherParLogin"/>  
                                            <button type="submit" name="submit" class="btn btn-success">Recherche de l'utilsateur</button>  
                                        </div>
                                    </div>

                                </fieldset>
                            </form> 
                        </div>
                        <div class="tab-pane" id="modifier">
                            <form class="form-horizontal" action="ServletUsers" method="get">
                                <fieldset>

                                    <legend>Modifier un utilisateur</legend>

                                    <div class="form-group">
                                        <label class="col-md-4 control-label" for="nom">Nom :</label>  
                                        <div class="col-md-4">
                                            <input id="nom" name="nom" type="text" placeholder="" class="form-control input-md" required="">
                                        </div>
                                    </div>

                                    <div class="form-group">
                                        <label class="col-md-4 control-label" for="prenom">Prénom :</label>  
                                        <div class="col-md-4">
                                            <input id="prenom" name="prenom" type="text" placeholder="" class="form-control input-md" required="">
                                        </div>
                                    </div>

                                    <div class="form-group">
                                        <label class="col-md-4 control-label" for="login">Login :</label>  
                                        <div class="col-md-4">
                                            <input id="login" name="login" type="text" placeholder="" class="form-control input-md" required="">
                                        </div>
                                    </div>

                                    <div class="form-group">
                                        <label class="col-md-4 control-label" for="password">Password :</label>  
                                        <div class="col-md-4">
                                            <input id="password" name="password" type="text" placeholder="" class="form-control input-md" required="">
                                        </div>
                                    </div>

                                    <div class="form-group">
                                        <div class="col-md-4">
                                            <!-- Astuce pour passer des paramètres à une servlet depuis un formulaire JSP !-->  
                                            <input type="hidden" name="action" value="modifierUnUtilisateur"/>  
                                            <button type="submit" name="submit" class="btn btn-warning">Mise à jour de l'utilisateur</button>  
                                        </div>
                                    </div>

                                </fieldset>
                            </form>  
                        </div>
                    </div>
                    <!-- Fin du menu -->  
                </div>
            </div>
        </c:if> 
        <c:if test="${empty login}">
            <p>Veuillez vous connecter pour acceder au fonctionnalité</p>
        </c:if>

    </body>
</html>
