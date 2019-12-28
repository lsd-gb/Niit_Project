package service;


public interface basicService<T> {
	public  T getByid(Integer id);

	public void delete(Integer id);

	 public void insert(T t);

	 public void update(T t);
	 public int selectNum();
}
