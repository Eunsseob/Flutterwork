enum Status {
  approved,
  Pending,
  rejected
}

void main(){
  Status status = Status.approved;

  if(status == Status.approved){
    print('승인 되었습니다.');
  } else if(status == Status.Pending){
    print('대기 ㄱㄱ');
  } else {
    print('거절이요');
  }
}