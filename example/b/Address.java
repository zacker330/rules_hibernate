package example.b;

import jakarta.persistence.Column;
import jakarta.persistence.Embeddable;

import java.lang.annotation.Annotation;

@Embeddable
public class Address {

    @Column(name = "st")
    private String street;

    @Column(name = "number")
    private int number;

}
