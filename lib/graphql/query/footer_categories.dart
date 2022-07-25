const String footerCategories = '''
  query {
  contentDynamicContentsSearchFooterContents(
    kind: footer_categories 
  ) 
    {
    nodes {
      dynamicContentable {
        ... on Category {
          name
          permalink
          __typename
        }
			}
    }
  }
  }
''';
