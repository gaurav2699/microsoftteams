import {screenshareMode, setButtonDisplay, streamLayout} from "./app_helper.js";

export default class Party {
        constructor(session) {
            this.session = session;
            this.watchLink = document.getElementById("watch-mode");
            this.subscribers = document.getElementById("subscribers");
            this.participantCount = document.getElementById("participant-count");
            this.videoPublisher = this.setupVideoPublisher();
            this.clickStatus = 'off';
            this.setupEventHandlers();
            this.connectionCount = 0;
            setButtonDisplay(this.watchLink);

        }
        setupVideoPublisher() {
            return OT.initPublisher('publisher', {
                insertMode: 'append',
                width: "100%",
                height: "100%",
                name: name
            }, function(error) {
                if (error) {
                    console.error('Failed to initialise publisher', error);
                };
            });
        }

        setupEventHandlers(){
            let self = this;
            this.session.on({
                sessionConnected: function (event){
                    self.session.publish(self.videoPublisher, function (error){
                        if(error){
                            console.error('Failed to publish the video', error);
                        }
                    });
                },
                streamCreated: function(event) {
                    // Subscribe to the stream that caused this event, and place it into the element with id="subscribers"
                    self.session.subscribe(event.stream, 'subscribers', {
                        insertMode: 'append',
                        width: "100%",
                        height: "100%"
                    }, function(error) {
                        if (error) {
                            console.error('Failed to subscribe', error);
                        }
                    });
                },
                connectionCreated: function(event) {
                    self.connectionCount++;
                    self.participantCount.textContent = `${self.connectionCount} Participants`;
                    streamLayout(self.subscribers, self.connectionCount);
                },
                connectionDestroyed: function(event) {
                    self.connectionCount--;
                    self.participantCount.textContent = `${self.connectionCount} Participants`;
                    streamLayout(self.subscribers, self.connectionCount);
                }
            });
            this.watchLink.addEventListener('click', function(event) {
                event.preventDefault();
                if (self.clickStatus == 'off') {
                    // Go to screenshare view

                    screenshareMode(self.session, 'on');
                };
            });
        }
}