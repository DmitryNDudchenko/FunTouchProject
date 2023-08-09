//
//  Displayable.swift
//  FunTouch
//
//  Created by Дмитрий on 03.03.2023.
//
protocol Displayable {

    var titleLabelText: String { get }
    var subtitleLabelText: String { get }

    var item1: (label: String, value: String) { get }
    var item2: (label: String, value: String) { get }
    var item3: (label: String, value: String) { get }

    var listTitle: String { get }
    var listItems: [String] { get }

}
