// MARK: - Mocks generated from file: PlayingCard/engine/WarGame.swift at 2020-12-28 23:23:47 +0000

//
//  WarGame.swift
//  PlayingCard
//
//  Created by iblis on 28/12/2020.
//

import Cuckoo
@testable import PlayingCard

import Foundation


 class MockWarGameListener: WarGameListener, Cuckoo.ProtocolMock {
    
     typealias MocksType = WarGameListener
    
     typealias Stubbing = __StubbingProxy_WarGameListener
     typealias Verification = __VerificationProxy_WarGameListener

     let cuckoo_manager = Cuckoo.MockManager.preconfiguredManager ?? Cuckoo.MockManager(hasParent: false)

    
    private var __defaultImplStub: WarGameListener?

     func enableDefaultImplementation(_ stub: WarGameListener) {
        __defaultImplStub = stub
        cuckoo_manager.enableDefaultStubImplementation()
    }
    

    

    

    
    
    
     func onGame(cpuCard: Card, cpuCardLeft: Int, playerCard: Card, playerCardLeft: Int)  {
        
    return cuckoo_manager.call("onGame(cpuCard: Card, cpuCardLeft: Int, playerCard: Card, playerCardLeft: Int)",
            parameters: (cpuCard, cpuCardLeft, playerCard, playerCardLeft),
            escapingParameters: (cpuCard, cpuCardLeft, playerCard, playerCardLeft),
            superclassCall:
                
                Cuckoo.MockManager.crashOnProtocolSuperclassCall()
                ,
            defaultCall: __defaultImplStub!.onGame(cpuCard: cpuCard, cpuCardLeft: cpuCardLeft, playerCard: playerCard, playerCardLeft: playerCardLeft))
        
    }
    

	 struct __StubbingProxy_WarGameListener: Cuckoo.StubbingProxy {
	    private let cuckoo_manager: Cuckoo.MockManager
	
	     init(manager: Cuckoo.MockManager) {
	        self.cuckoo_manager = manager
	    }
	    
	    
	    func onGame<M1: Cuckoo.Matchable, M2: Cuckoo.Matchable, M3: Cuckoo.Matchable, M4: Cuckoo.Matchable>(cpuCard: M1, cpuCardLeft: M2, playerCard: M3, playerCardLeft: M4) -> Cuckoo.ProtocolStubNoReturnFunction<(Card, Int, Card, Int)> where M1.MatchedType == Card, M2.MatchedType == Int, M3.MatchedType == Card, M4.MatchedType == Int {
	        let matchers: [Cuckoo.ParameterMatcher<(Card, Int, Card, Int)>] = [wrap(matchable: cpuCard) { $0.0 }, wrap(matchable: cpuCardLeft) { $0.1 }, wrap(matchable: playerCard) { $0.2 }, wrap(matchable: playerCardLeft) { $0.3 }]
	        return .init(stub: cuckoo_manager.createStub(for: MockWarGameListener.self, method: "onGame(cpuCard: Card, cpuCardLeft: Int, playerCard: Card, playerCardLeft: Int)", parameterMatchers: matchers))
	    }
	    
	}

	 struct __VerificationProxy_WarGameListener: Cuckoo.VerificationProxy {
	    private let cuckoo_manager: Cuckoo.MockManager
	    private let callMatcher: Cuckoo.CallMatcher
	    private let sourceLocation: Cuckoo.SourceLocation
	
	     init(manager: Cuckoo.MockManager, callMatcher: Cuckoo.CallMatcher, sourceLocation: Cuckoo.SourceLocation) {
	        self.cuckoo_manager = manager
	        self.callMatcher = callMatcher
	        self.sourceLocation = sourceLocation
	    }
	
	    
	
	    
	    @discardableResult
	    func onGame<M1: Cuckoo.Matchable, M2: Cuckoo.Matchable, M3: Cuckoo.Matchable, M4: Cuckoo.Matchable>(cpuCard: M1, cpuCardLeft: M2, playerCard: M3, playerCardLeft: M4) -> Cuckoo.__DoNotUse<(Card, Int, Card, Int), Void> where M1.MatchedType == Card, M2.MatchedType == Int, M3.MatchedType == Card, M4.MatchedType == Int {
	        let matchers: [Cuckoo.ParameterMatcher<(Card, Int, Card, Int)>] = [wrap(matchable: cpuCard) { $0.0 }, wrap(matchable: cpuCardLeft) { $0.1 }, wrap(matchable: playerCard) { $0.2 }, wrap(matchable: playerCardLeft) { $0.3 }]
	        return cuckoo_manager.verify("onGame(cpuCard: Card, cpuCardLeft: Int, playerCard: Card, playerCardLeft: Int)", callMatcher: callMatcher, parameterMatchers: matchers, sourceLocation: sourceLocation)
	    }
	    
	}
}

 class WarGameListenerStub: WarGameListener {
    

    

    
     func onGame(cpuCard: Card, cpuCardLeft: Int, playerCard: Card, playerCardLeft: Int)   {
        return DefaultValueRegistry.defaultValue(for: (Void).self)
    }
    
}



 class MockWarGame: WarGame, Cuckoo.ClassMock {
    
     typealias MocksType = WarGame
    
     typealias Stubbing = __StubbingProxy_WarGame
     typealias Verification = __VerificationProxy_WarGame

     let cuckoo_manager = Cuckoo.MockManager.preconfiguredManager ?? Cuckoo.MockManager(hasParent: true)

    
    private var __defaultImplStub: WarGame?

     func enableDefaultImplementation(_ stub: WarGame) {
        __defaultImplStub = stub
        cuckoo_manager.enableDefaultStubImplementation()
    }
    

    
    
    
     override var player: PlayerData {
        get {
            return cuckoo_manager.getter("player",
                superclassCall:
                    
                    super.player
                    ,
                defaultCall: __defaultImplStub!.player)
        }
        
        set {
            cuckoo_manager.setter("player",
                value: newValue,
                superclassCall:
                    
                    super.player = newValue
                    ,
                defaultCall: __defaultImplStub!.player = newValue)
        }
        
    }
    
    
    
     override var cpu: PlayerData {
        get {
            return cuckoo_manager.getter("cpu",
                superclassCall:
                    
                    super.cpu
                    ,
                defaultCall: __defaultImplStub!.cpu)
        }
        
        set {
            cuckoo_manager.setter("cpu",
                value: newValue,
                superclassCall:
                    
                    super.cpu = newValue
                    ,
                defaultCall: __defaultImplStub!.cpu = newValue)
        }
        
    }
    

    

    
    
    
     override func restartGame()  {
        
    return cuckoo_manager.call("restartGame()",
            parameters: (),
            escapingParameters: (),
            superclassCall:
                
                super.restartGame()
                ,
            defaultCall: __defaultImplStub!.restartGame())
        
    }
    
    
    
     override func play()  {
        
    return cuckoo_manager.call("play()",
            parameters: (),
            escapingParameters: (),
            superclassCall:
                
                super.play()
                ,
            defaultCall: __defaultImplStub!.play())
        
    }
    

	 struct __StubbingProxy_WarGame: Cuckoo.StubbingProxy {
	    private let cuckoo_manager: Cuckoo.MockManager
	
	     init(manager: Cuckoo.MockManager) {
	        self.cuckoo_manager = manager
	    }
	    
	    
	    var player: Cuckoo.ClassToBeStubbedProperty<MockWarGame, PlayerData> {
	        return .init(manager: cuckoo_manager, name: "player")
	    }
	    
	    
	    var cpu: Cuckoo.ClassToBeStubbedProperty<MockWarGame, PlayerData> {
	        return .init(manager: cuckoo_manager, name: "cpu")
	    }
	    
	    
	    func restartGame() -> Cuckoo.ClassStubNoReturnFunction<()> {
	        let matchers: [Cuckoo.ParameterMatcher<Void>] = []
	        return .init(stub: cuckoo_manager.createStub(for: MockWarGame.self, method: "restartGame()", parameterMatchers: matchers))
	    }
	    
	    func play() -> Cuckoo.ClassStubNoReturnFunction<()> {
	        let matchers: [Cuckoo.ParameterMatcher<Void>] = []
	        return .init(stub: cuckoo_manager.createStub(for: MockWarGame.self, method: "play()", parameterMatchers: matchers))
	    }
	    
	}

	 struct __VerificationProxy_WarGame: Cuckoo.VerificationProxy {
	    private let cuckoo_manager: Cuckoo.MockManager
	    private let callMatcher: Cuckoo.CallMatcher
	    private let sourceLocation: Cuckoo.SourceLocation
	
	     init(manager: Cuckoo.MockManager, callMatcher: Cuckoo.CallMatcher, sourceLocation: Cuckoo.SourceLocation) {
	        self.cuckoo_manager = manager
	        self.callMatcher = callMatcher
	        self.sourceLocation = sourceLocation
	    }
	
	    
	    
	    var player: Cuckoo.VerifyProperty<PlayerData> {
	        return .init(manager: cuckoo_manager, name: "player", callMatcher: callMatcher, sourceLocation: sourceLocation)
	    }
	    
	    
	    var cpu: Cuckoo.VerifyProperty<PlayerData> {
	        return .init(manager: cuckoo_manager, name: "cpu", callMatcher: callMatcher, sourceLocation: sourceLocation)
	    }
	    
	
	    
	    @discardableResult
	    func restartGame() -> Cuckoo.__DoNotUse<(), Void> {
	        let matchers: [Cuckoo.ParameterMatcher<Void>] = []
	        return cuckoo_manager.verify("restartGame()", callMatcher: callMatcher, parameterMatchers: matchers, sourceLocation: sourceLocation)
	    }
	    
	    @discardableResult
	    func play() -> Cuckoo.__DoNotUse<(), Void> {
	        let matchers: [Cuckoo.ParameterMatcher<Void>] = []
	        return cuckoo_manager.verify("play()", callMatcher: callMatcher, parameterMatchers: matchers, sourceLocation: sourceLocation)
	    }
	    
	}
}

 class WarGameStub: WarGame {
    
    
     override var player: PlayerData {
        get {
            return DefaultValueRegistry.defaultValue(for: (PlayerData).self)
        }
        
        set { }
        
    }
    
    
     override var cpu: PlayerData {
        get {
            return DefaultValueRegistry.defaultValue(for: (PlayerData).self)
        }
        
        set { }
        
    }
    

    

    
     override func restartGame()   {
        return DefaultValueRegistry.defaultValue(for: (Void).self)
    }
    
     override func play()   {
        return DefaultValueRegistry.defaultValue(for: (Void).self)
    }
    
}

