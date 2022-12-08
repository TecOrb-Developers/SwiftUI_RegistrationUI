//
//  Test.swift
//  SwiftUIRegistration
//
//  Created by Apple on 13/10/22.
//

import SwiftUI

struct Test: View {
    @State private var search:String = ""
    var body: some View {
        NavigationView
        {
            ScrollView{
                VStack(alignment: .leading) {
                    test1()
                    test2()
                        .padding()
                    test3(search: $search)
                    test4()
                    test5()
                }
            }
        }
        .navigationBarHidden(true)
        ignoresSafeArea(edges: .top)
    }
}

struct Test_Previews: PreviewProvider {
    static var previews: some View {
        Test()
    }
}

struct test1:View
{
    var body: some View
    {
        HStack{
            Button(action: {})
            {
                Image("menu")
                    .padding()
                    .background(Color.black)
                    .cornerRadius(10.0)
            }
            Spacer()
            Button(action: {})
            {
                Image("Profile")
                    .resizable()
                    .frame(width: 50, height: 50)
                    .cornerRadius(10.0)
            }
        }
        .padding(.horizontal)
    }
}

struct test2:View
{
    var body: some View
    {
        Text("find the \n best")
            .foregroundColor(Color.yellow)
        + Text(" Firniture")
            .bold()
            .foregroundColor(Color.yellow)
    }
}

struct test3:View
{ @Binding var search: String
    var body: some View
    {
        HStack{
            HStack{
                Image("Search")
                    .padding(.trailing , 1)
                TextField("Search firniture",text: $search)
            }
            .padding(.all,19)
            .background(Color.green)
            .cornerRadius(10.0)
            .padding()
            
            Button(action: {})
            {
                Image("Scan")
                    .padding()
                    .background(Color.green)
                    .cornerRadius(10.0)
            }
        }
        .padding(.horizontal)
    }
}

struct test4:View{
    private var test = ["All","Chair","Sofa","Lamp","Kitchen","Table"]
    @State private var selectedIndex: Int = 1
    var body: some View
    {
        ScrollView(.horizontal)
        {
            HStack(spacing: 4){
                ForEach(0..<test.count){ i in
                    Button(action: {selectedIndex = i})
                    {
                        
                        Text("\(test[i])")
                        
                    }
                }
                .padding(.horizontal)
            }
            
        }
    }
}

struct test5:View{
    
    var body: some View
    {
        
        VStack(alignment: .leading)
        {
            Text("Popular")
                .padding(.horizontal)
            ScrollView(.horizontal)
            {
                HStack{
                    ForEach (0..<10)
                    {
                        Image("chair_\($0)")
                            .resizable()
                    }
                    
                }
                
                
            }
            
        }
        
    }
}

struct test6:View
{
var body: some View {
    VStack{
        
    }
        }
    }

