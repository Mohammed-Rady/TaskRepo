package com.comhem.model;

import org.springframework.stereotype.Component;

@Component
public class Box {

    private int boxNumber;

    private boolean selected;

    private BoxValue boxValue;

    private boolean emptyAndOpened;

    public int getBoxNumber() {
        return boxNumber;
    }

    public void setBoxNumber(int boxNumber) {
        this.boxNumber = boxNumber;
    }

    public boolean isSelected() {
        return selected;
    }

    public void setSelected(boolean selected) {
        this.selected = selected;
    }

    public BoxValue getBoxValue() {
        return boxValue;
    }

    public void setBoxValue(BoxValue boxValue) {
        this.boxValue = boxValue;
    }

    public boolean isEmptyAndOpened() {
        return emptyAndOpened;
    }

    public void setEmptyAndOpened(boolean emptyAndOpened) {
        this.emptyAndOpened = emptyAndOpened;
    }

}
