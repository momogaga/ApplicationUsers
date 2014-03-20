/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package utilisateurs.gestionnaires;

import java.util.Collection;
import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;
import utilisateurs.modeles.Utilisateur;

/**
 *
 * @author MoMo
 */
@Stateless
public class GestionnaireUtilisateurs {

    // Ici injection de code : on n'initialise pas. L'entity manager sera créé  
    // à partir du contenu de persistence.xml  
    @PersistenceContext
    private EntityManager em;

    public void creerUtilisateursDeTest() {
        creeUnUtilisateur("John", "Lennon", "jlennon");
        creeUnUtilisateur("Paul", "Mac Cartney", "pmc");
        creeUnUtilisateur("Ringo", "Starr", "rstarr");
        creeUnUtilisateur("Georges", "Harisson", "georgesH");
    }

    public Utilisateur creeUnUtilisateur(String nom, String prenom, String login) {
        Utilisateur u = new Utilisateur(nom, prenom, login);
        em.persist(u);
        return u;
    }   
    
    public Collection<Utilisateur> chercherParLogin(String login){
        Query q = em.createQuery("select u from Utilisateur u where u.login=:login");
        q.setParameter("login", login);
        return q.getResultList();
    }

    public Collection<Utilisateur> getAllUsers() {
        // Exécution d'une requête équivalente à un select *  
        Query q = em.createQuery("select u from Utilisateur u");
        return q.getResultList();
    }
    // Add business logic below. (Right-click in editor and choose
    // "Insert Code > Add Business Method")
}
