package org.cejug.event.business;

import java.util.Calendar;
import java.util.List;

import javax.ejb.Stateless;
import javax.ejb.LocalBean;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

import org.cejug.event.entity.Event;
import org.cejug.util.EntitySupport;

/**
 * Manages partners of the user group.
 * @author Hildeberto Mendonca
 */
@Stateless
@LocalBean
public class EventBsn {
	
    @PersistenceContext
    private EntityManager em;

    public Event findEvent(String id) {
        if(id != null)
            return em.find(Event.class, id);
        else
            return null;
    }
    
    @SuppressWarnings("unchecked")
	public List<Event> findEvents() {
    	List<Event> events = em.createQuery("select e from Event e order by e.endDate desc")
        		               .getResultList();
        return events;
    }
    
    @SuppressWarnings("unchecked")
	public List<Event> findCommingEvents() {
    	Calendar today = Calendar.getInstance();
        List<Event> events = em.createQuery("select e from Event e where e.endDate >= :today order by e.endDate desc")
        		               .setParameter("today", today.getTime())
                               .getResultList();
        return events;
    }

    public void save(Event event) {
    	if(event.getId() == null || event.getId().isEmpty()) {
            event.setId(EntitySupport.generateEntityId());
            em.persist(event);
        }
        else {
            em.merge(event);
        }
    }

    public void remove(String id) {
        Event event = em.find(Event.class, id);
        if(event != null)
            em.remove(event);
    }
}