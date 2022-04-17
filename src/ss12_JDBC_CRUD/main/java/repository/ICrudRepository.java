package repository;

import java.util.List;

public interface ICrudRepository<E> {


    void save(E e);

    List<E> search(String name);
}
