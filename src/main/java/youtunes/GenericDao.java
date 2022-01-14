package youtunes;

import java.util.List;

/*
 * Generic interface for database manipulation
 */


public interface GenericDao<E, K> {
	
	public void add(E entity);
	
	public List<E> list();
	
	public E find(K key);
	
	public void update(E entity);
	
	public void remove(K key);
	
}
