postfix operator +

public postfix func + <T>(lhs: T) -> FluentInterface<T> {
  return FluentInterface(subject: lhs)
}

postfix operator -

public postfix func - <T>(lhs: FluentInterface<T>) -> T {
  return lhs.subject
}

/// [Flentinterface] Assign poperty within a wrapper
/// ## before
/// ```swift
///let point: CGPoint = {
///   var point = CGPoint()
///   point.x = 1
///   return point
/// }()
///```
/// ## after
/// ```swift
/// let point = CGPoint()+
///     .x(1)-
/// ```
/// resource  https://www.appcoda.com.tw/fluent-interface/
@dynamicMemberLookup public struct FluentInterface<Subject> {
  let subject: Subject
  
  // 因為要動到 subject 的屬性，所以 keyPath 的型別必須是 WritableKeyPath
  // 回傳值是一個 Setter 方法
  public subscript<Value>(dynamicMember keyPath: WritableKeyPath<Subject, Value>) -> ((Value) -> FluentInterface<Subject>) {
    
    var subject = self.subject
    
    return { value in
      subject[keyPath: keyPath] = value
      return FluentInterface(subject: subject)
    }
  }
  
  /// [Flentinterface] get the subject.
  public func unwrappingSubject() -> Subject {
    subject
	}
	/// [Fluentinterface] Quick way to touch subject and remain fluent interface
	/// - Parameter handle: A clou
	public nonmutating func handlingSubject(_ handle:
		(Subject) -> Void) -> Self {
		handle(subject)
		return self
	}
}
