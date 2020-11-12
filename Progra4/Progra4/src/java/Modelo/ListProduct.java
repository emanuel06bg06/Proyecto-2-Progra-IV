package Modelo;

import java.util.ArrayList;
import java.util.Optional;

public class ListProduct extends ArrayList<Producto> {

    public ListProduct() {
        super();
    }

    public float total() {
        float t = this.stream().map(element -> element.getTotal())
                .reduce(0.0f, (total, detalle) -> total + detalle);
        return t;
    }

    public Producto search(int id) {
        Optional<Producto> optional = this.stream().filter(elem -> elem.getId() == id).findFirst();
        if (optional.isPresent()) {
            return optional.get();
        } else {
            return null;
        }
    }

}
