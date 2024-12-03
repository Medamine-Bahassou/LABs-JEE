package ma.fstt.tables;

import jakarta.persistence.EntityManager;
import jakarta.persistence.EntityManagerFactory;
import jakarta.persistence.Persistence;

public class Test {

    public static void main(String[] args) {

        Client client = new Client();
        client.setNom("Mohamed Amine");
        client.setAddresse("BAHASSOU");
        client.setTelephone("0633812427");

        EntityManagerFactory emf =
                Persistence.createEntityManagerFactory("default");
        EntityManager em = emf.createEntityManager();
        em.getTransaction().begin();

        System.out.println("COMIITING");
        em.persist(client);
        em.getTransaction().commit();

    }
}
