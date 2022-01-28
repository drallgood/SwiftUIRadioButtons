//
//  SwiftUIView.swift
//  
//
//  Created by Ahmed Mokhtar on 10/17/20.
//

import SwiftUI

/// a structure that renders a vertical collection of radio buttons given a collection of identifaiable data.
@available(iOS 13.0, *)
public struct VRadioCollection<Data, Content>: View where Data: RandomAccessCollection, Content: View, Data.Element: Identifiable {
    
    @Binding private var selectedData: Data.Element?
    private let data: Data
    private let content: (Data.Element) -> Content
    
    /// Creates an instance that renders the `data` in a vertical radio button collection using `content` view builder. `selectedData` is a binding represents the current selected data.
    ///
    /// - Note: when `selectedData` is `nil` it means there is no currently selected data.
    ///
    /// - Parameters:
    ///     - selectedData: a binding represents the current selected data
    ///     - data: a `RandomAccessCollection` of data where the elements conforms to `Identifiable`, used to build the radio collection.
    ///     - content: a closure that takes an element of the given *data* and returns a view to be rendered to the right of the radio image.
    public init(selectedData: Binding<Data.Element?>, data: Data, @ViewBuilder content: @escaping (Data.Element) -> Content) {
        self._selectedData = selectedData
        self.content = content
        self.data = data
    }
    
    public var body: some View {
        VStack(alignment: .leading) {
            RadioCollection(selectedData: $selectedData, data: data, content: content)
        }
    }
}
