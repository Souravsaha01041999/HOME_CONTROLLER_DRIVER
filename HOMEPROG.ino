#define LED1 9
#define LED2 10
#define LED3 11
#define FAN 12
char simi;
void setup() {
  Serial.begin(9600);
  for(int i=9;i<=12;i++)
  {
    pinMode(i,OUTPUT);
    digitalWrite(i,1);
  }
  delay(200);
  digitalWrite(LED1,0);
  digitalWrite(LED2,0);
  digitalWrite(LED3,0);
  digitalWrite(FAN,0);
}
void loop() {
  simi=Serial.read();
  if(simi=='A')
  {
    digitalWrite(LED1,1);
  }
  else if(simi=='a')
  {
    digitalWrite(LED1,0);
  }
  else if(simi=='B')
  {
    digitalWrite(LED2,1);
  }
  else if(simi=='b')
  {
    digitalWrite(LED2,0);
  }
  else if(simi=='C')
  {
    digitalWrite(LED3,1);
  }
  else if(simi=='c')
  {
    digitalWrite(LED3,0);
  }
  else if(simi=='D')
  {
    digitalWrite(FAN,1);
  }
  else if(simi=='d')
  {
    digitalWrite(FAN,0);
  }
}
