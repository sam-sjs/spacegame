package com.spacegame.spacegame.model;

import org.junit.jupiter.api.Test;
import static org.assertj.core.api.Assertions.*;
public class SystemTests {
    @Test
    void aSystemShouldHaveADesignation() {
        Designation expectedDesignation = new Designation("system");
        System system = new System(expectedDesignation);

        assertThat(system.getDesignation()).isEqualTo(expectedDesignation);
    }
}
