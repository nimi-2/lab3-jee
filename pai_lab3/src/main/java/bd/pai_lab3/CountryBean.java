package bd.pai_lab3;

import java.io.Serializable;
import java.math.BigDecimal;

public class CountryBean implements Serializable {
    private String code;
    private String name;
    private int population;
    private BigDecimal surfaceArea;
    // Gettery i settery
    public String getCode() {
        return code;
    }

    public void setCode(String code) {
        this.code = code;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public int getPopulation() {
        return population;
    }

    public void setPopulation(int population) {
        this.population = population;
    }

    public BigDecimal getSurfaceArea() {
        return surfaceArea;
    }

    public void setSurfaceArea(BigDecimal surfaceArea) {
        this.surfaceArea = surfaceArea;
    }
}
