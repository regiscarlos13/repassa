const String footerCategories = '''
  query {
  contentDynamicContentsSearchFooterContents(
    kind: footer_brands 
  ) 
    {
    nodes {
      dynamicContentable {
        ... on Brand {
          name
          slug
          __typename
        }
			}
    }
  }
  }
''';
