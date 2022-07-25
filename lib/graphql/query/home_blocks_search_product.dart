const String homeblocksSearchProduct = '''
    query {
  homeBlocksSearchBlocks(
    kind: product 
    published: true

  ) 
    {
    nodes {
      blockProducts {
     product {
      name
      sizeName
      price
      images {
        imageUrl
      }
     brand {
        name
      }

    }
      }
    }
  }
  }

''';
