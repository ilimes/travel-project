package com.project.trip.result;

import lombok.Getter;
import lombok.Setter;

import java.util.List;

@Getter
@Setter
public class ListResultVO<T> {
    private boolean success;
    private List<T> data;
}
