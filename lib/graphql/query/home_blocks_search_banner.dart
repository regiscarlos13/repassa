const String homeblocksSearchBanner = '''
  query {
  homeBlocksSearchBlocks(
    kind: banner 
    published: true
  ) 
    {
    nodes {
      blockBanners{
        banner
      }
    }
  }
  }
''';
