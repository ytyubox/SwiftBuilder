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
@dynamicMemberLookup public final class FluentInterface<Subject> {
  
  public typealias FISetter<Value> = ((Value) -> FluentInterface<Subject>)
  
	public init(subject: Subject) {
		self.subject = subject
	}
  var subject: Subject
  
  // 因為要動到 subject 的屬性，所以 keyPath 的型別必須是 WritableKeyPath
  // 回傳值是一個 Setter 方法
	public subscript<Value>(dynamicMember keyPath: WritableKeyPath<Subject, Value>) -> ((Value) -> FluentInterface<Subject>) {
    
    return { value in
		self.subject[keyPath: keyPath] = value
      return self
    }
  }
  
  /// [Flentinterface] get the subject.
  public func unwrappingSubject() -> Subject {
    subject
  }
  /// [Fluentinterface] Quick way to touch subject and remain fluent interface
  /// - Parameter handlel: A cloure to get the subject
  public  func handlingSubject(_ handle:
    (Subject) -> Void) -> Self {
    handle(subject)
    return self
  }
  /// [Fluentinterface] Quick way to manipulate subject and remain fluent interface
  /// - Parameter handle: A cloure to inout set subject
  public  func manipulateSubjct(_ handle:
    (inout Subject) -> Void) -> Self {
    handle(&subject)
	return self
  }
}
