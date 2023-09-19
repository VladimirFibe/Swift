import Combine
import SwiftUI

typealias Callback = () -> Void
typealias Bag = Set<AnyCancellable>

class Store<Event, Action> {
    private(set) var events = PassthroughSubject<Event, Never>()
    private(set) var actions = PassthroughSubject<Action, Never>()

    var bag = Bag()
    
    init() {
        setupActionHandlers()
    }
    
    func sendAction(_ action: Action) {
        actions.send(action)
    }
    
    func sendEvent(_ event: Event) {
        events.send(event)
    }
    
    func setupActionHandlers() {
        actions.sink { [weak self] action in
            guard let self = self else { return }
            self.handleActions(action)
        }.store(in: &bag)
    }
    
    func handleActions(_ action: Action) {
        
    }
    
    func statefulCall(_ action: @MainActor @escaping () async throws -> ()) {
        Task {
            await stateful(action: action)
        }
    }
    
    @MainActor
    func stateful(action: @MainActor @escaping () async throws -> ()) async {
        do {
            try await action()
        } catch {}
    }
}
