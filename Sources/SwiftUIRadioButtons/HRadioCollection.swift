//
//  HRadioCollection.swift
//  
//
//  Created by Ahmed Mokhtar on 10/28/20.
//

import SwiftUI


@available(iOS 13.0, *)
public struct HRadioCollection<Data, Content>: View where Data: RandomAccessCollection, Content: View, Data.Element: Identifiable {
    
    private let content: (Data.Element) -> Content
    private let data: Data
    
    @Binding var selectedData: Data.Element?
    
    public init(selectedData: Binding<Data.Element?>, data: Data, @ViewBuilder content: @escaping (Data.Element) -> Content) {
        self._selectedData = selectedData
        self.content = content
        self.data = data
    }
    
    public var body: some View {
        HStack {
            RadioCollection(selectedData: $selectedData, data: data, content: content)
        }
    }
}
