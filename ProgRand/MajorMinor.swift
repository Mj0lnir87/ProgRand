struct MajorMinor{
    var major: [String] = [Note().CSharp, Note().FSharp, Note().B, Note().E, Note().A, Note().D, Note().G, Note().C, Note().F, Note().Bb, Note().Eb, Note().Ab, Note().Db, Note().Gb, Note().Cb]
    
    var minor: [String] = [Note().ASharp, Note().DSharp, Note().GSharp, Note().CSharp, Note().FSharp, Note().B, Note().E, Note().A, Note().D, Note().G, Note().C, Note().F, Note().Bb, Note().Eb, Note().Ab]
    
    
    
    var sharps: [String] = [Note().A, Note().ASharp, Note().B, Note().C, Note().CSharp, Note().D, Note().DSharp, Note().E, Note().F, Note().FSharp, Note().G, Note().GSharp]
    
    var flats: [String] = [Note().A, Note().Bb, Note().B, Note().C, Note().Db, Note().D, Note().Eb, Note().E, Note().F, Note().Gb, Note().G, Note().Ab]
}
